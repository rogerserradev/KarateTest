package examples.dragonball;

import com.intuit.karate.junit5.Karate;

public class DragonBallRunner {

    @Karate.Test
    Karate testUsers() {
        return Karate.run("dragonball").relativeTo(getClass());
    }

}
