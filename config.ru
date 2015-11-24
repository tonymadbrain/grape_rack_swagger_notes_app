require 'rack'
require 'rubygems'
require 'bundler/setup'
require 'grape'
require './app/core'
require './app/api/notes'

run Notes
