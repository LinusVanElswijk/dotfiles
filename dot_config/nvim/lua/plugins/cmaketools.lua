return {
  "Civitasv/cmake-tools.nvim",
  opts = {
    cmake_command = "bearcmake",
    cmake_executor = {
      name = "overseer",
    },
  },
  keys = {
    { "<leader>mr", ":CMakeRun<cr>", { desc = "CMake Run" } },
    { "<leader>mm", ":CMakeBuild<cr>", { desc = "CMake Build" } },
    { "<leader>mf", ":CMakeBuildCurrentFile<cr>", { desc = "CMake Build Current File" } },
    { "<leader>mg", ":CMakeGenerate<cr>", { desc = "CMake Generate" } },
    { "<leader>mc", ":CMakeClean<cr>", { desc = "CMake Clean" } },
    { "<leader>ms", ":CMakeSettings<cr>", { desc = "CMake Base Settings" } },
    { "<leader>mS", ":CMakeTargetSettings<cr>", { desc = "CMake Target Settings" } },
    { "<leader>mt", ":CMakeSelectBuildTarget<cr>", { desc = "CMake Select Build Target" } },
    { "<leader>me", ":CMakeSelectLaunchTarget<cr>", { desc = "CMake Select Launch Target" } },
    { "<leader>mT", ":CMakeRunTest<cr>", { desc = "CMake Run Test" } },
  },
}
