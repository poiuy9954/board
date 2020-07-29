package org.zzin.dto;

import lombok.*;
import org.zzin.domain.BoardVO;

import java.time.LocalDateTime;

@Builder
@Data
@ToString
@AllArgsConstructor
@NoArgsConstructor
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
