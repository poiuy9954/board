package serviceTests;

import commons.TestCommon;
import lombok.extern.log4j.Log4j;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.zzin.domain.BoardVO;
import org.zzin.dto.BoardDTO;
import org.zzin.dto.PageDTO;
import org.zzin.service.BoardService;

@Log4j
public class BoardServiceTests extends TestCommon {

    @Autowired
    private BoardService boardService;

    @Test
    public void serviceDeleteTest(){
        String result = boardService.deletePost(BoardDTO.builder()
                .bno(102L)
                .build());
        log.info(result);
    }

    @Test
    public void serviceModifyTest(){
        String result = boardService.modifyPost(BoardDTO.builder()
                .bno(102L)
                .title("modi Test...")
                .content("modi Test...")
                .writer("regi Test...")
                .build());
        log.info(result);
    }

    @Test
    public void serviceRegisterTest(){
        String result = boardService.registerPost(BoardDTO.builder()
                .title("regi Test...")
                .content("regi Test...")
                .writer("regi Test...")
                .build());
        log.info(result);
    }

    @Test
    public void serviceReadPostTest(){
        BoardDTO result = boardService.readPost(2L);
        log.info(result);
    }

    @Test
    public void serviceGetListTest(){
        boardService.getList(new PageDTO(0,10)).forEach((i)->{
            log.info(i);
        });
    }
}
