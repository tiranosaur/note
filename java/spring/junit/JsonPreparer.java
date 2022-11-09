import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;
import org.springframework.util.ResourceUtils;

import java.io.File;

public class JsonPreparer<V> {
    public static <T> T prepare(String fileName, TypeReference<T> typeReference) {
        try {
            File file = ResourceUtils.getFile("classpath:" + fileName);
            ObjectMapper objectMapper = new ObjectMapper();
            objectMapper.registerModule(new JavaTimeModule());

            return objectMapper.readValue(file, typeReference);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}


 List<User> userList  = JsonPreparer.prepare("json/users.json", new TypeReference<List<User>>() {
        });
