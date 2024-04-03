package TestSuite;
import com.intuit.karate.junit5.Karate;

public class Runner {
    @Karate.Test
    public Karate runMealPlan(){
        return Karate.run ("MealPlan/mealplan").relativeTo((getClass()));
    }

    @Karate.Test
    public Karate runMisc(){
        return Karate.run ("Misc/misc").relativeTo((getClass()));
    }
    /*@Karate.Test
    public Karate runStore() {
        return Karate.run ("Store/store").relativeTo((getClass()));
    }

    @Karate.Test
    public Karate runUser() {
        return Karate.run ("User/user").relativeTo((getClass()));
    }*/

    @Karate.Test
    public Karate runReceipes(){
        return Karate.run ("Receipes/receipes").relativeTo((getClass()));
    }

}

