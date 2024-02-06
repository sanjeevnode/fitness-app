import mongoose from "mongoose";
export default mongoose.model(
  "exercises",
  new mongoose.Schema({}),
  "exercises"
);
