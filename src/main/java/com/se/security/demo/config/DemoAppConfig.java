package com.se.security.demo.config;

import java.beans.PropertyVetoException;
import java.util.Properties;
import java.util.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.dao.annotation.PersistenceExceptionTranslationPostProcessor;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.orm.hibernate5.HibernateTransactionManager;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.handler.SimpleMappingExceptionResolver;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;
import com.mchange.v2.c3p0.ComboPooledDataSource;

import javax.persistence.EntityManagerFactory;
import javax.sound.sampled.AudioFormat.Encoding;
import javax.sql.DataSource;
@Configuration
@EnableWebMvc //Provides similar support to <mvc:annotation-driven /> in XML
@ComponentScan(basePackages="com.se.security.demo")
@PropertySource("classpath:persistence-mssql.properties")
@EnableTransactionManagement
public class DemoAppConfig implements WebMvcConfigurer{
// set up variable to hold the properties
    @Autowired
    private Environment env;
   
    // set up a logger for diagnostics
    private Logger logger = Logger.getLogger(getClass().getName());

// define a bean for ViewResolver
    @Bean
    public ViewResolver viewResolver() {
            InternalResourceViewResolver viewResolver =
                    new InternalResourceViewResolver();
           
            viewResolver.setPrefix("/WEB-INF/view/");
            viewResolver.setSuffix(".jsp");
          
           
            
            return viewResolver; }
    // define a bean for our security datasource

    //step 1
@Bean
public DataSource securityDataSource() {
        // create connection pool
        ComboPooledDataSource securityDataSource
           = new ComboPooledDataSource();
        // set the jdbc driver class
        try {
                securityDataSource.setDriverClass(env.getProperty("jdbc.driver"));
        } catch (PropertyVetoException exc) {
                throw new RuntimeException(exc);   }
      // set database connection props
        securityDataSource.setJdbcUrl(env.getProperty("jdbc.url"));
        securityDataSource.setUser(env.getProperty("jdbc.user"));
        securityDataSource.setPassword(env.getProperty("jdbc.password"));
        // set connection pool props
        securityDataSource.setInitialPoolSize(
                        getIntProperty("connection.pool.initialPoolSize"));
        securityDataSource.setMinPoolSize(
                        getIntProperty("connection.pool.minPoolSize"));
        securityDataSource.setMaxPoolSize(
                        getIntProperty("connection.pool.maxPoolSize"));
        securityDataSource.setMaxIdleTime(
                        getIntProperty("connection.pool.maxIdleTime"));
        // log the connection props 
        //just to make sure we are REALLY reading data from properties file
        logger.info(">>> jdbc.url=" + env.getProperty("jdbc.url"));
        logger.info(">>> jdbc.user=" + env.getProperty("jdbc.user"));
        return securityDataSource;
       }
//step 2
@Bean
public LocalSessionFactoryBean sessionFactory(){
	 LocalSessionFactoryBean sessionFactory = new LocalSessionFactoryBean();
     sessionFactory.setDataSource(securityDataSource());
     sessionFactory.setPackagesToScan("com.se.security.demo");
     Properties prop = new Properties();
     prop.setProperty("hibernate.dialect", "org.hibernate.dialect.SQLServer2012Dialect");
     
     prop.setProperty("hibernate.show_sql", "true");
     /*
     <property name="hibernate.connection.CharSet">utf8</property>
     <property name="hibernate.connection.characterEncoding">utf8</property>
     <property name="hibernate.connection.useUnicode">true</property>
     */
     prop.setProperty("hibernate.connection.CharSet", "utf8");
     prop.setProperty("hibernate.connection.characterEncoding", "utf8");
     prop.setProperty("hibernate.connection.useUnicode", "true");
     sessionFactory.setHibernateProperties(prop);
     return sessionFactory;
}
//step 3
@Bean
public HibernateTransactionManager hibernateTransactionManager() {
	HibernateTransactionManager txManager = new HibernateTransactionManager();
	txManager.setSessionFactory(sessionFactory().getObject());
	return txManager;
	
}
	
private int getIntProperty(String propName) {

        String propVal = env.getProperty(propName);

        // now convert to int
        int intPropVal = Integer.parseInt(propVal);

        return intPropVal;
    }
    public void addResourceHandlers(final ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/resources/**").addResourceLocations("/resources/");
    }
    
 


	

	
	
}









