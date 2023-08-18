package co.yedam.mealkit.common;

import java.util.HashMap;

import com.google.common.base.CaseFormat;

@SuppressWarnings("rawtypes")
public class CamelHashMap extends HashMap{

    @Override
    public Object put(Object key, Object value) {
        return super.put(toLowerCamel((String) key), value);
    }
   
    private static String toLowerCamel(String key) {
        return CaseFormat.UPPER_UNDERSCORE.to(CaseFormat.LOWER_CAMEL, key);
    }
}
