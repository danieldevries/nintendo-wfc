#!/usr/bin/env puma

threads_count = ENV.fetch('PUMA_THREADS') { 1 }.to_i

threads threads_count, threads_count
workers ENV.fetch('WORKERS', 0).to_i

preload_app!

port ENV.fetch('PORT') { 4567 }.to_i
environment ENV.fetch('RACK_ENV') { 'production' }
