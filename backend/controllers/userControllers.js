import User from "../models/userModel.js";
import { getBMI } from "../utils.js";

// @desc    create a new user
// @route   POST /api/user
// @access  Public

export const createUser = async (req, res) => {
  try {
    const { name, age, height, weight, gender } = req.body;

    const isUserExists = await User.findOne({
      name,
      age,
      height,
      weight,
      gender,
    });
    if (isUserExists) {
      return res.status(400).json({ message: "User already exists" });
    }

    const user = await User.create({
      name,
      age,
      height,
      weight,
      gender,
    });

    // const { bmi, bmiRange } = getBMI(weight, height);
    // console.log(bmi, bmiRange);

    // res.status(201).json({ bmi: bmi, bmiRange: bmiRange });

    // await user.save();

    res.status(201).json({
      _id: user._id,
      name: user.name,
      age: user.age,
      height: user.height,
      weight: user.weight,
      workouts: user.workouts,
    });
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

export const getUser = async (req, res) => {
  try {
    const user = await User.find({});
    res.status(200).json(user);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};
