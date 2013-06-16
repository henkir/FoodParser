#!/usr/bin/env ruby
require 'simplecov'
SimpleCov.start

$VERBOSE = 2

$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../main")
$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'tc_page'
require 'tc_page_reader'
require 'tc_husman_page'
require 'tc_chili_page'
require 'tc_cominn_page'
require 'tc_brodernas_page'
