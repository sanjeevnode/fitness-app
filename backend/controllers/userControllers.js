import Exercise from "../models/exerciseModel.js";
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

    const { bmi, bmiRange } = getBMI(weight, height);
    const exercises = await Exercise.find({ range: bmiRange });

    const workouts = {
      fullBody: exercises[0].get("fullBody"),
      arms: exercises[0].get("arms"),
      legs: exercises[0].get("legs"),
      chest: exercises[0].get("chest"),
    };

    const user = await User.create({
      name,
      age,
      height,
      weight,
      gender,
      workouts,
    });

    res.status(201).json({
      _id: user._id,
      name: user.name,
      age: user.age,
      height: user.height,
      weight: user.weight,
      gender: gender,
      bmi: bmi.toString(),
      bmiRange: bmiRange,
      workouts: user.workouts,
    });
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

// @desc    get all users
// @route   GET /api/user
// @access  Public
export const getUser = async (req, res) => {
  try {
    const user = await User.find({});
    res.status(200).json(user);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

// @desc    get user by id
// @route   GET /api/user/:id
// @access  Public

export const getUserById = async (req, res) => {
  try {
    const user = await User.findById(req.params.id);
    const { bmi, bmiRange } = getBMI(user.weight, user.height);

    res.status(200).json({
      _id: user._id,
      name: user.name,
      age: user.age,
      height: user.height,
      weight: user.weight,
      gender: user.gender,
      bmi: bmi.toString(),
      bmiRange: bmiRange,
      workouts: user.workouts,
    });
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};
