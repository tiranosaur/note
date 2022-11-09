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

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Approver {
    @JsonProperty("pnr")
    private Long pnr;
    @JsonProperty("num")
    private String number;
    @JsonProperty("tms")
    private Long timestamp;
}

@Data
@AllArgsConstructor
@NoArgsConstructor
public class User {
    private UUID id;
    private String name;
    private int age;
}

List<User> userList  = JsonPreparer.prepare("json/users.json", new TypeReference<List<User>>() {});
Approver approver = JsonPreparer.prepare("json/approver.json", new TypeReference<Approver>() {});
