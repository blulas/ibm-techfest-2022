package com.ibm.ba.dm.demo.queries;

import org.kie.kogito.rules.DataSource;
import org.kie.kogito.rules.DataStore;
import org.kie.kogito.rules.RuleUnitData;

public class LoanUnit implements RuleUnitData {

    private int maxAmount;

    private DataStore<LoanApplication> loanApplications;
    private DataStore<AllAmounts> allAmounts;

    public LoanUnit() {
        this(DataSource.createStore(), DataSource.createStore());
    }

    public LoanUnit(DataStore<LoanApplication> loanApplications, DataStore<AllAmounts> allAmounts) {
        this.loanApplications = loanApplications;
        this.allAmounts = allAmounts;
    }

    public DataStore<LoanApplication> getLoanApplications() {
        return loanApplications;
    }

    public void setLoanApplications(DataStore<LoanApplication> loanApplications) {
        this.loanApplications = loanApplications;
    }

    public DataStore<AllAmounts> getAllAmounts() {
        return allAmounts;
    }

    public void setAllAmounts(DataStore<AllAmounts> allAmounts) {
        this.allAmounts = allAmounts;
    }

    public int getMaxAmount() {
        return maxAmount;
    }

    public void setMaxAmount(int maxAmount) {
        this.maxAmount = maxAmount;
    }

}
