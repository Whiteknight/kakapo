# Copyright 2010, Austin Hastings. See accompanying LICENSE file, or
# http://www.opensource.org/licenses/artistic-license-2.0.php for license.

class Library {

    has $!init_marshaller;
    has $!load_marshaller;

    our method at_init($sub, $name?, :$namespace = Parrot::caller_namespace(), :@requires) {
            $!init_marshaller.add_call($sub, $name, :namespace($namespace), :requires(@requires));
    }

    our method at_initload($sub, $name?, :$namespace = Parrot::caller_namespace(), :@requires) {
            $!init_marshaller.add_call($sub, $name, :namespace($namespace), :requires(@requires));
            $!load_marshaller.add_call($sub, $name, :namespace($namespace), :requires(@requires));
    }

    our method at_load($sub, $name?, :$namespace = Parrot::caller_namespace(), :@requires) {
            $!load_marshaller.add_call($sub, $name, :namespace($namespace), :requires(@requires));
    }

    our method do_init() {
            $!init_marshaller.process_queue(self);
    }

    our method do_load() {
            $!load_marshaller.process_queue(self);
    }

    our method _init_obj(*@pos, *%named) {
            $!init_marshaller := ComponentMarshaller.new(:name('init'));
            $!load_marshaller := ComponentMarshaller.new(:name('load'));
            self._init_args(|@pos, |%named);
    }

    our method module_initload_done($name) {
            $!init_marshaller.mark_as_done($name);
            $!load_marshaller.mark_as_done($name);
    }
}
