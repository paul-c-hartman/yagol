# Copyright (c) 2023, Paul Hartman
# All rights reserved.

# This source code is licensed under the BSD-style license found in the
# LICENSE file in the root directory of this source tree.
require "bundler/setup"
require "yaml"

require_relative "game_of_life"

opts = YAML.load_file("../cfg/main.yml")
GameOfLife.new(**opts).show
