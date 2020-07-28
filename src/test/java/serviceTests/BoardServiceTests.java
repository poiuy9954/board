package serviceTests;

import commons.TestCommon;
import lombok.extern.log4j.Log4j;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.zzin.service.BoardService;

@Log4j
public class BoardServiceTests extends TestCommon {

    @Autowired
    private BoardService boardService;

    @Test
    public void serviceGetListTest(){
        boardService.getList().forEach((i)->{
            log.info(i);
        });
    }
}
