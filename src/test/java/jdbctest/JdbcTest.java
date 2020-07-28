package jdbctest;


import commons.TestCommon;
import lombok.Data;
import lombok.extern.log4j.Log4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.sql.DataSource;

@Log4j

public class JdbcTest extends TestCommon {

    @Autowired
    private DataSource dataSource;

    @Test
    public void testJdbc(){
        log.info(dataSource);
    }

    @Test
    public void test1(){

        System.out.println("왜안되이이이잉");

    }
}
