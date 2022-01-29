import java.sql.Timestamp;
import java.util.Calendar;

/*
    Date date = new Date();
    Timestamp timestamp = new Timestamp(date.getTime());
    timestamp = TimestampUtil.addHours(timestamp, 288);
    System.out.println(timestamp);
*/

public class TimestampUtil {
    public static Timestamp addHours(Timestamp date, int hours) {
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        cal.add(Calendar.HOUR, hours);
        return new Timestamp(cal.getTime().getTime());
    }
}
