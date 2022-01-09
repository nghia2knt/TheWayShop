package com.se.security.demo.config;

import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.User.UserBuilder;
import org.springframework.security.web.AuthenticationEntryPoint;

@Configuration
@EnableWebSecurity
public class DemoSecurityConfig extends WebSecurityConfigurerAdapter {
// add a reference to our security data source
@Autowired
private DataSource securityDataSource;
@Override
 protected void configure(AuthenticationManagerBuilder auth) throws Exception {
	 auth.jdbcAuthentication().dataSource(securityDataSource).authoritiesByUsernameQuery("select taikhoan as username, loai as ROLE from Nguoidung where taikhoan = ?")
	  .usersByUsernameQuery("select taikhoan as username,matkhau as password, 'true' as enabled from Nguoidung where taikhoan =?");
 
 }
@Override
protected void configure(HttpSecurity http) throws Exception {
	 http.csrf().disable();
	 http.authorizeRequests().antMatchers("/").permitAll();
	 http.authorizeRequests().antMatchers("/dathang/**").hasAnyRole("QUANLY","NGUOIDUNG");
	 http.authorizeRequests().antMatchers("/nguoidung/**").hasAnyRole("QUANLY");
	 http.authorizeRequests().antMatchers("/hoadon/**").hasAnyRole("QUANLY");
	 http.authorizeRequests().antMatchers("/canhan/**").hasAnyRole("QUANLY","NGUOIDUNG");
	 http.exceptionHandling().accessDeniedHandler(new CustomAccessDeniedHandler()).and()
     .exceptionHandling().authenticationEntryPoint(new CustomHttp403ForbiddenEntryPoint());
	
	 http.authorizeRequests().and().formLogin()
     .loginProcessingUrl("/authenticateTheUser")
     .loginPage("/dangnhap")
     .defaultSuccessUrl("/",true)
     ;
	 http.authorizeRequests().and().logout().logoutUrl("/dangxuat").permitAll();
}

}







