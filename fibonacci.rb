# frozen_string_literal: true

require 'benchmark'

class Fibonacci
  class << self
    def fib1(n)
      res = [1, 0]
      n.times { res.prepend(res.first + res.pop) }
      res.first
    end

    def fib2(n)
      (2..n).reduce({ 0 => 0, 1 => 1 }) do |seq, index|
        seq[index] = seq[index-1] + seq[index-2]
        seq
      end[n]
    end

    def fib3(n)
      seq = { 0 => 0, 1 => 1 }

      (2..n).each do |index|
        seq[index] = seq[index-1] + seq[index-2]
      end

      seq[n]
    end

    def fib4(n)
      return n if n < 2

      fib4(n-1) + fib4(n-2)
    end
  end
end

def benchmark(method)
  (0..40).each do |i|
    Fibonacci.public_send(method, i)
  end
end

Benchmark.bm do |x|
  Fibonacci.methods.select { |method| /fib[\d]/ =~ method }.sort.each do |method|
    x.report("#{method}:") { benchmark(method) }
  end
end
