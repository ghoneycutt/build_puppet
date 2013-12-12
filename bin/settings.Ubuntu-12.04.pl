
my @op = @packages;
@packages = ();
foreach (@op) {
  push(@packages, 'ncurses59') if (/^readline/);
  push(@packages, $_);
}

$bits = `uname -m` ;
if ($bits =~ /i686/) {
  $syst = 'linux-elf' ;
} else {
  $syst = 'linux-x86_64' ;
}

$openssl098w = {
    %{$openssl098w},
    'configure' => "./Configure  -L${prefix}/lib -I${prefix}/include shared zlib-dynamic --prefix=${prefix} --openssldir=${prefix} ${syst} -static-libgcc",
} ;

$openssl101e = {
    %{$openssl101e},
    'configure' => "./Configure  -L${prefix}/lib -I${prefix}/include shared zlib-dynamic --prefix=${prefix} --openssldir=${prefix} ${syst} -static-libgcc",
} ;

$ruby187p358 = {
    %{$ruby187p358},
    'configure' => "./configure --prefix=${prefix} LDFLAGS=\'-static-libgcc -L${prefix}/lib -Wl,-rpath,${prefix}/lib \' CPPFLAGS=-I${prefix}/include",
} ;

$ncurses59 = {
    'name'      => 'Ncurses 5.9',
    'fetch'     => 'wget http://ftp.gnu.org/pub/gnu/ncurses/ncurses-5.9.tar.gz',
    'pkgsrc'    => "${top}/tgzs/ncurses-5.9.tar.gz",
    'srcdir'    => "${top}/${src}/ncurses-5.9",
    'packup'    => 'gunzip -c  %PKGSRC% | tar xvf -',
    'configure' => "./configure --with-pc-files --with-shared --prefix=${prefix} LDFLAGS='-static-libgcc -L${prefix}/lib -Wl,-rpath,${prefix}/lib' CFLAGS=-static-libgcc",
    'make'      => 'make',
    'install'   => 'make install',
    'env' => {
  'PATH'    => $pathmap {$platform_os} || '/bin:/usr/bin',
    },
} ;

$augeas110 = {
    %{$augeas110},
    'configure' => "./configure --prefix=${prefix} CPPFLAGS=-I${prefix}/include LDFLAGS=\'-L${prefix}/lib -Wl,-rpath,${prefix}/lib\' CFLAGS=\'-static-libgcc -lncurses\'",
    'make'      => 'make',
    'install'   => 'make install',
} ;

$ruby_augeas050 = {
    %{$ruby_augeas050},
    'configure' => "cd ext/augeas ; ${prefix}/bin/ruby extconf.rb ; cd ../..",
    'make'      => 'cd ext/augeas ; make ; cd ../..',
    'install'   => "cp lib/augeas.rb ${prefix}/lib/ruby/site_ruby/1.8 ; cd ext/augeas ; make install",
} ;

$rubyshadow214 = {
    %{$rubyshadow214},
    'make'      => 'make CC=\'gcc -static-libgcc\'',
    'install'   => 'make install',
} ;
