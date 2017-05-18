package res;

import java.util.HashMap;

/**
 * Created by Administrator on 2017/5/18.
 */
public class StaticMap {
    public static HashMap<Integer,String > statusOfPropose=new HashMap<Integer,String>(){{
       put(0,"待处理");
       put(1,"月嫂同意");
       put(2,"月嫂拒绝");
       put(3,"客户取消");
       put(4,"达成协议");
    }};
    public static HashMap<Integer,String> statusOfService = new HashMap<Integer,String>(){{

    }};
}
