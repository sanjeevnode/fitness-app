import Exercise from "../models/exerciseModel.js";

export const getExercises = async (req, res) => {
  try {
    const exercises = await Exercise.find({});
    res.status(200).json(exercises);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

export const getExerciseByRange = async (req, res) => {
  try {
    const { range } = req.params;
    const exercises = await Exercise.find({ range });
    res.status(200).json(exercises);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};
