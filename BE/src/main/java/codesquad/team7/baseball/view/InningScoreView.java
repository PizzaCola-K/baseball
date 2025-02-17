package codesquad.team7.baseball.view;

import codesquad.team7.baseball.game.BaseballGameTeamInformation;

import java.util.List;

public class InningScoreView {

    private List<Integer> home;
    private List<Integer> away;

    private InningScoreView(List<Integer> home, List<Integer> away) {
        this.home = home;
        this.away = away;
    }

    public static InningScoreView of(BaseballGameTeamInformation homeTeamInformation, BaseballGameTeamInformation awayTeamInformation) {
        return new InningScoreView(
            homeTeamInformation.getInningScore(),
            awayTeamInformation.getInningScore()
        );
    }

    public List<Integer> getHome() {
        return home;
    }

    public List<Integer> getAway() {
        return away;
    }
}
