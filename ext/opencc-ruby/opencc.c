#include <ruby.h>
#include <opencc/opencc.h>

/* our new native method; it just returns
 * !" */
static VALUE ruby_opencc_open(VALUE self, VALUE rubyConfig) {
  opencc_t od;
  char * config = "zhs2zht.ini";
  if (TYPE(rubyConfig)==T_STRING && RSTRING(rubyConfig)->len>0) {
    config = RSTRING(rubyConfig)->ptr;
  }
  od = opencc_open(config);
  if (od == (opencc_t) -1) {
    return Qfalse;
  } else {
    return INT2NUM((int)od);
  }
}

static VALUE ruby_opencc_close(VALUE self, VALUE rubyOD) {
  opencc_t od;
  od = (opencc_t) NUM2UINT(rubyOD);
  if (opencc_close(od)==-1) {
    return Qfalse;
  } else {
    return Qtrue;
  }
}

static VALUE ruby_opencc_convert(VALUE self, VALUE rubyOD, VALUE inputString) {
  opencc_t od;
  od = (opencc_t) NUM2UINT(rubyOD);
  char * outbuf = opencc_convert_utf8(od, RSTRING(inputString)->ptr, RSTRING(inputString)->len);
  return rb_str_new2(outbuf);
}

/* ruby calls this to load the extension */
void Init_opencc(void) {
  /* assume we haven't yet defined Hola */
  VALUE kmodule = rb_define_module("Opencc");

  /* register opencc methods to ruby module.
   * the opencc_open function can be called from ruby as "Opencc.open"
   * */
  rb_define_module_function(kmodule,
      "open", ruby_opencc_open, 1);
  rb_define_module_function(kmodule,
      "close", ruby_opencc_close, 1);
  rb_define_module_function(kmodule,
      "convert", ruby_opencc_convert, 2);
}

