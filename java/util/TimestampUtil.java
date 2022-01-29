import java.sql.Timestamp;
import java.util.Calendar;

/*
    Date date = new Date();
    Timestamp timestamp = new Timestamp(date.getTime());
    timestamp = TimestampUtil.getInstance().addHours(timestamp, 288);
*/

public class TimestampUtil {
    private static TimestampUtil INSTANCE;
    public final Logger LOGGER = LoggerFactory.getLogger(TimestampUtil.class);

    private TimestampUtil() {
    }

    public static TimestampUtil getInstance() {
        if(INSTANCE == null) {
            INSTANCE = new TimestampUtil();
        }
        return INSTANCE;
    }

    public Timestamp addHours(Timestamp date, int hours) {
        LOGGER.debug("TimestampUtil.addHours(date = [{}], hours = [{}])", date, hours);
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        cal.add(Calendar.HOUR, hours);
        return new Timestamp(cal.getTime().getTime());
    }
}
