package com.myWeb.www.config;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;

@MapperScan(basePackages = {"com.myWeb.www.repository"})
@ComponentScan(basePackages = {"com.myWeb.www.service"})
@EnableTransactionManagement
@Configuration
public class RootConfig {

	//DB설정 부분
	//hikariCP 사용 / log4jdbc-log4j2 사용
	
	@Autowired
	ApplicationContext applicationContext;
	
	@Bean
	public DataSource dataSource() {
		HikariConfig hikariConfig = new HikariConfig();
		//log4jdbc - log4j2 
		hikariConfig.setDriverClassName("net.sf.log4jdbc.sql.jdbcapi.DriverSpy");
		hikariConfig.setJdbcUrl("jdbc:log4jdbc:mysql://localhost:3306/mywebdb");
		hikariConfig.setUsername("mywebUser");
		hikariConfig.setPassword("mysql");
		
		//최대 커넥션 갯수
		hikariConfig.setMaximumPoolSize(5);
		//최소 유휴 커넥션 갯수 (위의 값과 같은 값으로 설정)
		hikariConfig.setMinimumIdle(0);
		//test 쿼리문
		hikariConfig.setConnectionTestQuery("SELECT now()");
		//pool 이름 설정 
		hikariConfig.setPoolName("springHikariCP");
		
		//추가 설정
		//cachePrepStmts - cache사용 여부 설정 
		hikariConfig.addDataSourceProperty("dataSource.cachePrepStmts", "true");
		//mysql 드라이버가 연결 당 cache statement 의 수에 대한 설절 250-500 사이 권장
		hikariConfig.addDataSourceProperty("dataSource.prepStmtsCacheSize", "250");
		//connection 당 캐싱 할 preparedStatement 의 개수 지정 옵션 : default 256
		hikariConfig.addDataSourceProperty("dataSource.prepStmtCacheSqlLimit", "true");
		//mysql 서버에서 최신 이슈가 있을 경우 지원받는 설정 (옵션 - 안해도 됨)
		hikariConfig.addDataSourceProperty("dataSource.useServerPrepStmts", "true");
		
		HikariDataSource hikariDataSource = new HikariDataSource(hikariConfig);
		return hikariDataSource;
	}
	@Bean
	public SqlSessionFactory sqlSessionFactory() throws Exception{
		SqlSessionFactoryBean sqlFactoryBean = new SqlSessionFactoryBean();

		sqlFactoryBean.setDataSource(dataSource());
		//경로 설정 
		sqlFactoryBean.setMapperLocations(
				applicationContext.getResources("classpath:/mappers/*.xml"));
		sqlFactoryBean.setConfigLocation(
				applicationContext.getResource("classpath:/MybatisConfig.xml"));
		return sqlFactoryBean.getObject();
				
	}
	
	//트렌젝션 매니저 빈 설정
	@Bean
	public DataSourceTransactionManager transactionManager() {
		return new DataSourceTransactionManager(dataSource());
	}
}
