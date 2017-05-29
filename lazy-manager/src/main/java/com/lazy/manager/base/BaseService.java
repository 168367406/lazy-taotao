package com.lazy.manager.base;


import com.lazy.commons.base.BaseBean;
import com.lazy.manager.dao.MenuDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Coding......
 * Created by D.SR on 2017/3/3.
 */
@Service
public class BaseService<T> extends BaseBean<T> {
    @Autowired
    protected MenuDao menuDao;
}
