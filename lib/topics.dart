import 'package:flutter/material.dart';

class Element {
  // ex : Maturity Value
  String title;
  List<Topic> topicsIncluded = [];
  List<Formula> formulas = [];

  Formula Function(List<Keyword> keywords)? formulaChecker;
  Element({required this.title, this.formulaChecker});
}

class Topic {
  // ex : Promissory Notes
  // ex : Bank Discount
  String topic;
  List<Keyword> keywords = [];
  Topic({required this.topic});
}

class Keyword {
  // ex : Maturity Value, Face Value, Term of the loan
  // ex : Bank Discount, Discount Rate, Discount Term, Proceeds
  String keyword;
  String variable;
  Keyword({required this.keyword, required this.variable});
}

class Formula {
  String formula;

  Formula({required this.formula});
}

bool ifKeywordsContains(List<Keyword> keywords, String variable) {
  return keywords.any((element) => element.variable == variable);
}

class TopicsProvider extends ChangeNotifier {
  Element simpleInterest = Element(
      title: "Simple Interest",
      formulaChecker: (keywords) {
        bool containsI = ifKeywordsContains(keywords, 'I');
        bool containsS = ifKeywordsContains(keywords, 'S');
        bool containsT = ifKeywordsContains(keywords, 't');

        if (containsI) {
          return Formula(formula: r'$$I=PrT$$');
        } else if (containsS) {
          return Formula(formula: r'$$S=P(1+rt)');
        } else {
          return Formula(formula: "entah");
        }
      });
  Element simpleAmount = Element(title: "Simple Amount");
  Element maturityValue = Element(title: "Maturity Value");
  Element faceValue = Element(title: "Face Value");
  Element bankDiscount = Element(title: "Bank Discount");
  Element discountRate = Element(title: "Discount Rate");
  Element proceeds = Element(title: "Proceeds");
  Element equivalentSimpleInterest =
      Element(title: "Equivalent Simple Interest");
  Element discountedPromissoryNotes =
      Element(title: "Discounted Promissory Notes");
  Element compounded = Element(title: "Compounded");
  Element compoundedInterest = Element(title: "Compounded Interest");

  Element amountAtTheEnd = Element(title: "Amount At The End");
  Element futureValue = Element(title: "Future Value");
  Element presentValue = Element(title: "Present Value");
  Element invested = Element(title: "Invested");
  Element every = Element(title: "Every");
  Element payment = Element(title: "Payment");
  Element interestEarned = Element(title: "Interest Earned");
  Element interestPaid = Element(title: "Interest Paid");
  Element tradeDiscount = Element(title: "Trade Discount");
  Element cashDiscount = Element(title: "Cash Discount");
  Element listPrice = Element(title: "List Price");
  Element netPrice = Element(title: "Net Price");
  //Element tradeDiscount = Element(title: "");
  Element markdown = Element(title: "Markdown");
  Element sellingPrice = Element(title: "Selling Price");
  Element grossProfit = Element(title: "Gross Profit");
  Element operationalExpenses = Element(title: "Operational Expenses");
  Element netProfit = Element(title: "Net Profit");
  Element breakEvenPrice = Element(title: "Break Even Price");
  //Element grossProfit = Element(title: "");
  Element cashPrice = Element(title: "Cash Price");
  Element installmentPrice = Element(title: "Installment Price");
  Element monthlyPayment = Element(title: "Monthly Payment");
  Element totalInterest = Element(title: "Total Interest");
  Element originalBalance = Element(title: "Original Balance");
  Element reducingBalance = Element(title: "Reducing Balance");
  Element constantRatioFormula = Element(title: "Constant Ratio Formula");
  Element ruleOf78 = Element(title: "Rule of 78");
  Element unearnedInterest = Element(title: "Unearned Interest");
  Element straightLineMethod = Element(title: "Straight Line Method");
  Element decliningBalanceMethod = Element(title: "Declining Balance Method");
  Element cost = Element(title: "Cost");
  Element usefulLife = Element(title: "Useful Life");
  Element scrapValue = Element(title: "Scrap Value");
  Element salvageValue = Element(title: "Salvage Value");
  Element depreciation = Element(title: "Depreciation");
  Element singleDiscountEquivalent = Element(title: "singleDiscountEquivalent");
  Element markup = Element(title: "Markup");

  Topic simpleInterestTopic = Topic(topic: "SIMPLE INTEREST");
  Topic promissoryNotes = Topic(topic: "PROMISSORY NOTES");
  Topic bankDiscountTopic = Topic(topic: "BANK DISCOUNT");
  Topic compoundInterest = Topic(topic: "COMPOUND INTEREST");
  Topic annuity = Topic(topic: "ANNUITY");
  Topic tradeAndCashDiscount = Topic(topic: "TRADE AND CASH DISCOUNT");
  Topic markupAndMarkdown = Topic(topic: "MARKUP AND MARKDOWN");
  Topic installmentPurchases = Topic(topic: "INSTALLEMNT PURCHASES");
  Topic depreciationTopic = Topic(topic: "DEPRECIATION");

  Keyword simpleInterestKeyword =
      Keyword(keyword: 'Simple Interest', variable: 'I');
  Keyword simpleAmountKeyword =
      Keyword(keyword: 'Simple Amount', variable: 'S');
  Keyword termOfTheLoanKeyword =
      Keyword(keyword: 'Term of the Loan', variable: 't');
  Keyword maturityValueKeyword =
      Keyword(keyword: 'Maturity Value', variable: 'S');
  Keyword faceValueKeyword = Keyword(keyword: 'Face Value', variable: 'P');

  Keyword bankDiscountKeyword =
      Keyword(keyword: 'Bank Discount', variable: 'D');
  Keyword discountRateKeyword =
      Keyword(keyword: 'Discount Rate', variable: 'd');
  Keyword discountTermKeyword =
      Keyword(keyword: 'Discount Term', variable: 't');
  Keyword proceedsKeyword = Keyword(keyword: 'Proceeds', variable: 'Pr');

  Keyword simpleInterestRateEquivalentKeyword =
      Keyword(keyword: 'Simple interest rate equivalent', variable: 'r');
  Keyword bankDiscountRateEquivalentKeyword =
      Keyword(keyword: 'Bank discount rate equivalent', variable: 'd');

  Keyword compoundedKeyword = Keyword(keyword: 'Compounded', variable: 'S');
  Keyword compoundInterestKeyword =
      Keyword(keyword: 'Compound Interest', variable: 'S');
  Keyword amountAtTheEndKeyword =
      Keyword(keyword: 'Amount at the end', variable: 'S');
  Keyword futureValueKeyword = Keyword(keyword: 'Future value', variable: 'S');

  Keyword initialDepositKeyword =
      Keyword(keyword: 'Initial Deposit', variable: 'P');
  Keyword nominalRateKeyword = Keyword(keyword: 'Nominal rate', variable: 'k');
  Keyword termOfTheLoanInvestmentKeyword = Keyword(
      keyword: 'Term of the loan/investment (in days/years)', variable: 't');
  Keyword totalInterestKeyword =
      Keyword(keyword: 'Total interest', variable: 'I');

  Keyword futureValueAnnuityKeyword =
      Keyword(keyword: 'Future value', variable: 'S');
  Keyword presentValueAnnuityKeyword =
      Keyword(keyword: 'Present value', variable: 'A');
  Keyword investedKeyword = Keyword(keyword: 'Invested', variable: 'S');
  Keyword everyKeyword = Keyword(keyword: 'Every', variable: 'R');
  Keyword paymentKeyword = Keyword(keyword: 'Payment', variable: 'R');
  Keyword interestEarnedAnnuityKeyword =
      Keyword(keyword: 'Interest Earned', variable: 'I');
  Keyword interestPaidAnnuityKeyword =
      Keyword(keyword: 'Interest Paid', variable: 'I');

  Keyword tradeDiscountKeyword =
      Keyword(keyword: 'Trade discount', variable: 'TD');
  Keyword cashDiscountKeyword =
      Keyword(keyword: 'Cash discount', variable: 'TD');
  Keyword listPriceKeyword = Keyword(keyword: 'List Price', variable: 'TD');
  Keyword netPriceKeyword = Keyword(keyword: 'Net Price', variable: 'NP');
  Keyword singleDiscountEquivalentKeyword =
      Keyword(keyword: 'Single Discount Equivalent', variable: 'd');

  Keyword markupKeyword = Keyword(keyword: 'Markup', variable: 'SP');
  Keyword markdownKeyword = Keyword(keyword: 'Markdown', variable: 'MD');
  Keyword sellingPriceKeyword =
      Keyword(keyword: 'Selling price', variable: 'SP');
  Keyword breakevenPriceKeyword =
      Keyword(keyword: 'Breakeven price', variable: 'BEP');
  Keyword grossProfitKeyword = Keyword(keyword: 'Gross profit', variable: 'SP');
  Keyword operationalExpensesKeyword =
      Keyword(keyword: 'Operational expenses', variable: 'SP');
  Keyword netProfitKeyword = Keyword(keyword: 'Net profit', variable: 'SP');
  Keyword breakEvenPriceKeyword =
      Keyword(keyword: 'Break Even Price', variable: 'BEP');

  Keyword cashPriceKeyword = Keyword(keyword: 'Cash Price', variable: 'CP');
  Keyword installmentPriceKeyword =
      Keyword(keyword: 'Instalment price', variable: 'IP');
  Keyword monthlyPaymentKeyword =
      Keyword(keyword: 'Monthly payment', variable: 'MP');
  Keyword totalInterestInstallmentKeyword =
      Keyword(keyword: 'Total interest', variable: 'I');
  Keyword originalBalanceKeyword =
      Keyword(keyword: 'Original balance', variable: 'OB');
  Keyword reducingBalanceKeyword =
      Keyword(keyword: 'Reducing balance', variable: 'OB');
  Keyword constantRatioFormulaKeyword =
      Keyword(keyword: 'Constant Ratio Formula', variable: 'I');
  Keyword ruleOf78Keyword = Keyword(keyword: 'Rule of 78', variable: 'OPB');
  Keyword unearnedInterestKeyword =
      Keyword(keyword: 'Unearned Interest', variable: 'k');

  Keyword straightLineMethodKeyword =
      Keyword(keyword: 'Straight line method', variable: 'TD');
  Keyword decliningBalanceMethodKeyword =
      Keyword(keyword: 'Declining Balance method', variable: 'TD');
  Keyword costKeyword = Keyword(keyword: 'Cost', variable: 'TD');
  Keyword usefulLifeKeyword = Keyword(keyword: 'Useful life', variable: 'BV');
  Keyword scrapValueKeyword =
      Keyword(keyword: 'Scrap value', variable: 'Ann Depr');
  Keyword salvageValueKeyword =
      Keyword(keyword: 'Salvage value', variable: 'Acc depr');
  Keyword depreciationKeyword = Keyword(keyword: 'Depreciation', variable: 'r');

  // assign
  List<Element> getElements() {
    List<Element> elements = [];
    simpleInterest.topicsIncluded = [simpleInterestTopic];
    simpleAmount.topicsIncluded = [simpleInterestTopic];

    maturityValue.topicsIncluded = [promissoryNotes, bankDiscountTopic];
    faceValue.topicsIncluded = [promissoryNotes, bankDiscountTopic];
    bankDiscount.topicsIncluded = [promissoryNotes, bankDiscountTopic];
    discountRate.topicsIncluded = [promissoryNotes, bankDiscountTopic];
    proceeds.topicsIncluded = [promissoryNotes, bankDiscountTopic];
    equivalentSimpleInterest.topicsIncluded = [
      promissoryNotes,
      bankDiscountTopic
    ];
    discountedPromissoryNotes.topicsIncluded = [
      promissoryNotes,
      bankDiscountTopic
    ];

    compounded.topicsIncluded = [compoundInterest];
    compoundedInterest.topicsIncluded = [compoundInterest];
    amountAtTheEnd.topicsIncluded = [compoundInterest];
    futureValue.topicsIncluded = [compoundInterest, annuity];

    presentValue.topicsIncluded = [annuity];
    invested.topicsIncluded = [annuity];
    every.topicsIncluded = [annuity];
    payment.topicsIncluded = [annuity];
    interestEarned.topicsIncluded = [annuity];
    interestPaid.topicsIncluded = [annuity];

    tradeDiscount.topicsIncluded = [tradeAndCashDiscount];
    cashDiscount.topicsIncluded = [tradeAndCashDiscount];
    listPrice.topicsIncluded = [tradeAndCashDiscount];
    netPrice.topicsIncluded = [tradeAndCashDiscount];
    singleDiscountEquivalent.topicsIncluded = [tradeAndCashDiscount];

    markup.topicsIncluded = [markupAndMarkdown];
    markdown.topicsIncluded = [markupAndMarkdown];
    sellingPrice.topicsIncluded = [markupAndMarkdown];
    breakEvenPrice.topicsIncluded = [markupAndMarkdown];
    grossProfit.topicsIncluded = [markupAndMarkdown];
    operationalExpenses.topicsIncluded = [markupAndMarkdown];
    netProfit.topicsIncluded = [markupAndMarkdown];

    cashPrice.topicsIncluded = [installmentPurchases];
    installmentPrice.topicsIncluded = [installmentPurchases];
    monthlyPayment.topicsIncluded = [installmentPurchases];
    totalInterest.topicsIncluded = [installmentPurchases];
    originalBalance.topicsIncluded = [installmentPurchases];
    reducingBalance.topicsIncluded = [installmentPurchases];
    constantRatioFormula.topicsIncluded = [installmentPurchases];
    ruleOf78.topicsIncluded = [installmentPurchases];
    unearnedInterest.topicsIncluded = [installmentPurchases];

    straightLineMethod.topicsIncluded = [depreciationTopic];
    decliningBalanceMethod.topicsIncluded = [depreciationTopic];
    cost.topicsIncluded = [depreciationTopic];
    usefulLife.topicsIncluded = [depreciationTopic];
    scrapValue.topicsIncluded = [depreciationTopic];
    salvageValue.topicsIncluded = [depreciationTopic];
    depreciation.topicsIncluded = [depreciationTopic];

    simpleInterestTopic.keywords = [
      simpleInterestKeyword,
      simpleAmountKeyword,
      termOfTheLoanKeyword
    ];
    promissoryNotes.keywords = [
      maturityValueKeyword,
      faceValueKeyword,
      termOfTheLoanKeyword
    ];
    bankDiscountTopic.keywords = [
      bankDiscountKeyword,
      discountRateKeyword,
      discountTermKeyword,
      proceedsKeyword,
      simpleInterestRateEquivalentKeyword,
      bankDiscountRateEquivalentKeyword
    ];
    compoundInterest.keywords = [
      amountAtTheEndKeyword,
      initialDepositKeyword,
      nominalRateKeyword,
      termOfTheLoanInvestmentKeyword,
      totalInterestKeyword
    ];
    annuity.keywords = [
      futureValueKeyword,
      interestEarnedAnnuityKeyword,
      presentValueAnnuityKeyword,
      interestPaidAnnuityKeyword,
      monthlyPaymentKeyword
    ];
    tradeAndCashDiscount.keywords = [
      tradeDiscountKeyword,
      netPriceKeyword,
      singleDiscountEquivalentKeyword
    ];
    markupAndMarkdown.keywords = [
      sellingPriceKeyword,
      markdownKeyword,
      breakEvenPriceKeyword
    ];
    installmentPurchases.keywords = [
      cashPriceKeyword,
      installmentPriceKeyword,
      monthlyPaymentKeyword,
      totalInterestInstallmentKeyword,
      originalBalanceKeyword,
      totalInterestKeyword
    ];
    depreciationTopic.keywords = [
      straightLineMethodKeyword,
      decliningBalanceMethodKeyword
    ];

    elements = [
      simpleInterest,
      simpleAmount,
      maturityValue,
      faceValue,
      bankDiscount,
      discountRate,
      proceeds,
      equivalentSimpleInterest,
      discountedPromissoryNotes,
      compounded,
      compoundedInterest,
      amountAtTheEnd,
      futureValue,
      presentValue,
      invested,
      every,
      payment,
      interestEarned,
      interestPaid,
      tradeDiscount,
      cashDiscount,
      listPrice,
      netPrice,
      tradeDiscount,
      markdown,
      sellingPrice,
      breakEvenPrice,
      grossProfit,
      operationalExpenses,
      netProfit,
      cashPrice,
      installmentPrice,
      monthlyPayment,
      totalInterest,
      originalBalance,
      reducingBalance,
      constantRatioFormula,
      ruleOf78,
      unearnedInterest,
      straightLineMethod,
      decliningBalanceMethod,
      cost,
      usefulLife,
      scrapValue,
      salvageValue,
      depreciation
    ];
    return elements;
  }
}
