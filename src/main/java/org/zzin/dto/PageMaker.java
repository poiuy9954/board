package org.zzin.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PageMaker {

    private PageDTO pageDTO;

    private int total;
    private int start, end;

    private boolean prev, next;

    public PageMaker(PageDTO pageDTO, int total) {
        this.pageDTO = pageDTO;
        this.total = total;

        int tempEnd = (int) (Math.ceil(pageDTO.getPage() / 10.0)) * 10;
        this.start = tempEnd - 9;

        int realEnd = (int) (Math.ceil(total / (double) pageDTO.getAmount()));
        this.end = realEnd < tempEnd ? realEnd : tempEnd;

        this.prev = start != 1;
        this.next = realEnd > tempEnd;
    }
}
