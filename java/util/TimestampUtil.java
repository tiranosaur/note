import java.sql.Timestamp;
import java.util.Calendar;

//@NoArgsConstructor(access = AccessLevel.PRIVATE)
public class TimestampUtil {
    private static TimestampUtil INSTANCE;
    private final Logger LOGGER = LoggerFactory.getLogger(TimestampUtil.class);

    private TimestampUtil() {
    }

    public static TimestampUtil getInstance() {
        if(INSTANCE == null) {
            INSTANCE = new TimestampUtil();
        }
        return INSTANCE;
    }

    //add hours to timestamp
    /*
        Date date = new Date();
        Timestamp timestamp = new Timestamp(date.getTime());
        timestamp = TimestampUtil.getInstance().addHours(timestamp, 288);
    */
    public Timestamp addHours(Timestamp timestamp, int hours) {
        LOGGER.debug("TimestampUtil.addHours(date = [{}], hours = [{}])", timestamp, hours);
        Calendar cal = Calendar.getInstance();
        cal.setTime(timestamp);
        cal.add(Calendar.HOUR, hours);
        return new Timestamp(cal.getTime().getTime());
    }
}
