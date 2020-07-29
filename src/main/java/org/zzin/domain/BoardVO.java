package org.zzin.domain;

import lombok.Builder;
import lombok.Getter;
import lombok.ToString;
import org.zzin.dto.BoardDTO;

import java.time.LocalDateTime;

@Builder
@ToString
@Getter
public class BoardVO {

    private Long bno;
    private String title, content, writer;
    private LocalDateTime regdate, moddate;

    public BoardDTO toBoardDTO(){
        return BoardDTO.builder()
                .bno(this.bno)
                .title(this.title)
                .content(this.content)
                .writer(this.writer)
                .regdate(this.regdate)
                .moddate(this.moddate)
                .build();
    }

}
