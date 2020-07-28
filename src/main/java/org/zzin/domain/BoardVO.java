package org.zzin.domain;

import lombok.Builder;
import lombok.Getter;
import lombok.ToString;

import java.time.LocalDateTime;

@Builder
@ToString
@Getter
public class BoardVO {

    private Long bno;
    private String title, content, writer;
    private LocalDateTime regdate, moddate;

}
