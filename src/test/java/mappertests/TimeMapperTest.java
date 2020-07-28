package mappertests;

import commons.TestCommon;
import lombok.extern.log4j.Log4j;
import org.zzin.mapper.TimeMapper;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

@Log4j
public class TimeMapperTest extends TestCommon {

    @Autowired
    private TimeMapper timeMapper;

    @Test
    public void timeTest(){
        log.info(timeMapper);
        log.info(timeMapper.getTime());
    }

}
