// Moving this class to C - To make it faster
#include <ruby.h>
#include <stdio.h>

static VALUE t_init(VALUE self, VALUE chart, VALUE args)
{
  int i = 0;
  long len = RARRAY(args)->len;
  for (i; i < len; i++){
    RARRAY(args)->ptr[i] = simple_moving_average(chart, RARRAY(args)->ptr[i]);
  }
}



void Init_SimpleMovingAverage(){
  VALUE portfolio = rb_define_module("Portfolio");
  VALUE algorythms = rb_define_module_under(portfolio, "Algorythms");
  VALUE cSimpleMovingAverage = rb_define_class_under(algorythms, "SimpleMovingAverage", rb_cObject);
  rb_define_method(cSimpleMovingAverage, "initialize", t_init, 2);
}

// TODO: Implement this guy
int simple_moving_average(chart, cell){
  return 1;
}


  // def initialize(chart, *args)
  //   args.first.each do |length|
  //     simple_moving_average(chart, length)
  //   end
  // end