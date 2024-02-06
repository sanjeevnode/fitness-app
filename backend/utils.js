export const getBMI = (weight, height) => {
  let bmi = weight / (height / 100) ** 2;
  bmi = Number(bmi.toFixed(2));
  let bmiRange = "";

  if (bmi < 18.5) {
    bmiRange = "underweight";
  } else if (bmi >= 18.5 && bmi < 24.9) {
    bmiRange = "normal";
  } else if (bmi >= 25 && bmi < 29.9) {
    bmiRange = "overweight";
  } else if (bmi >= 30) {
    bmiRange = "obese";
  } else {
    bmiRange = "invalid";
  }

  return {
    bmi,
    bmiRange,
  };
};
