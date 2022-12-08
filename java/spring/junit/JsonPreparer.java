import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;
import org.springframework.util.ResourceUtils;

import java.io.File;
import java.io.StringReader;

public class JsonPreparer {
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

    public static <T> T toObject(String json, TypeReference<T> typeReference) {
        try {
            StringReader reader = new StringReader(json);
            ObjectMapper objectMapper = new ObjectMapper();
            objectMapper.registerModule(new JavaTimeModule());

            return objectMapper.readValue(reader, typeReference);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @SneakyThrows
    public static <T> String toString(T t) {
        ObjectMapper mapper = new ObjectMapper();
        mapper.registerModule(new JavaTimeModule());
        mapper.disable(SerializationFeature.WRITE_DATES_AS_TIMESTAMPS);
        return mapper.writeValueAsString(t);
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
