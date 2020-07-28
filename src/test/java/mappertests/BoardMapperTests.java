package mappertests;

import commons.TestCommon;
import lombok.extern.log4j.Log4j;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.zzin.domain.BoardVO;
import org.zzin.mapper.BoardMapper;

import java.util.stream.IntStream;

@Log4j
public class BoardMapperTests extends TestCommon {

    @Autowired
    private BoardMapper boardMapper;

    @Test
    public void deleteTest(){
        int result = boardMapper.delete(1L);
        log.info(result);
    }

    @Test
    public void updateTest() {
        int result = boardMapper.update(BoardVO.builder()
                .bno(1L)
                .title("updateTitle...1")
                .content("updateCotent...1")
                .build());
        log.info(result);
    }

    @Test
    public void getListTest() {
        boardMapper.getList().forEach((i) -> {
            log.info(i);
        });
    }

    @Test
    public void selectTest() {
        log.info(boardMapper.select(new Long(1L)));
    }

    @Test
    public void insertTest() {
        BoardVO vo = BoardVO.builder()
                .title("title...1")
                .content("content...1")
                .writer("user00")
                .build();
        boardMapper.insert(vo);
    }

    @Test
    public void dummiesAdd() {

        IntStream.rangeClosed(1, 100).forEach(i -> {

            boardMapper.insert(BoardVO.builder()
                    .title("title..." + i)
                    .content("content..." + i)
                    .writer("user" + (i % 10))
                    .build());

        });


    }


}
