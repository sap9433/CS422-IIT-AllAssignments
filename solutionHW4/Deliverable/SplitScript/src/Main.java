import java.io.BufferedWriter;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.*;
import java.util.stream.Collectors;
import java.util.stream.Stream;

public class Main {
    public static final String ipfile1 = "/Users/diesel/Desktop/Assignments&Coursework/422/hw4/ml-latest-small/movies.csv";
    public static final String ipfile2 = "/Users/diesel/Desktop/Assignments&Coursework/422/hw4/ml-latest-small/ratings.csv";
    public static final String odir = "/Users/diesel/Desktop/Assignments&Coursework/422/hw4/Deliverable/hw4.movies/user";

    public static void main(String[] args) throws Exception {
        Map<String, String> movies =  Files.lines(Paths.get(ipfile1)).
                parallel().
                collect(Collectors.toMap(
                        line -> line.split(",")[0],
                        line -> line.split(",")[1])
                );
        Stream<String> allRatings = Files.lines(Paths.get(ipfile2));

        Map<String, TreeSet<String>> viewList = new HashMap<>();

        allRatings.parallel().forEach(line -> {
            String[] ratings = line.split(",");
            try {
                String user = ratings[0], movieId = ratings[1], movieName = movies.get(movieId);
                if(user.equals("userId") || movieName == null) return;
                TreeSet<String> watched = viewList.get(user);
                if(watched == null)watched = new TreeSet<String>();
                watched.add(movieName.replace("\"","").trim());
                viewList.put(user,watched);
            } catch (Exception e) {
                System.out.println(line + "\n\n\n");
                System.out.println(e);
            }
        });

        viewList.keySet().parallelStream().forEach(userID -> {
            Set userRatings = viewList.get(userID);
            String joined = String.join("\n", userRatings);
            try {
                BufferedWriter writer = Files.newBufferedWriter(Paths.get(odir+userID+".txt"));
                writer.write(joined+"\n");
                writer.close();
            }catch (Exception e){}
        });
    }
}
