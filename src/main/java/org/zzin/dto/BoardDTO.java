package org.zzin.dto;

import lombok.Builder;
import lombok.Data;
import lombok.ToString;
import org.zzin.domain.BoardVO;

import java.time.LocalDateTime;

@Builder
@Data
@ToString
public class BoardDTO {

    private Long bno;
    private String title, content, writer;
    private LocalDateTime regdate, moddate;

    public BoardVO toBoardVO(){
        return BoardVO.builder()
                .bno(this.bno)
                .title(this.title)
                .content(this.content)
                .writer(this.writer)
                .build();
    }

}
