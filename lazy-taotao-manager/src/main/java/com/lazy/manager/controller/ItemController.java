package com.lazy.manager.controller;

import com.lazy.manager.base.BaseController;
import com.lazy.manager.base.BaseService;
import com.lazy.manager.pojo.Item;
import com.lazy.manager.pojo.PageInfoDataGrid;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * ItemController
 * PROJECT_NAME: lazy-taotao
 * PACKAGE_NAME: com.lazy.web.controller
 * Created by Lazy on 2017/5/30 14:43
 * Version: 0.1
 * Info: @TODO:...
 */
@Controller
@RequestMapping("item")
public class ItemController extends BaseController<ItemController> {
    @RequestMapping("getItemById/{id}")
    @ResponseBody
    public Item getItemById(@PathVariable Long id) {
        System.out.println(id);
        return itemService.getTbItemById(id);
    }
    @RequestMapping("list")
    @ResponseBody
    public PageInfoDataGrid getItemList(long page,long rows){
        return itemService.getItemList(page,rows);
    }
}
