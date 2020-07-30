package org.zzin.mapper;

import java.util.*;

public interface CRUD<V, L> {

    public int insert(V v);
    public V select(L l);
    public int update(V v);
    public int delete(L l);

}
