import express from "express";
import {
  getExerciseByRange,
  getExercises,
} from "../controllers/exercisControllers.js";

const router = express.Router();

router.get("/api/exercise", getExercises);
router.get("/api/exercise/:range", getExerciseByRange);

export default router;
