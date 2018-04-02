<?php

// autoload_static.php @generated by Composer

namespace Composer\Autoload;

class ComposerStaticInit9c8a4e6f46788e12c33474ee6ec81887
{
    public static $prefixLengthsPsr4 = array (
        'J' => 
        array (
            'Jenssegers\\ImageHash\\' => 21,
        ),
    );

    public static $prefixDirsPsr4 = array (
        'Jenssegers\\ImageHash\\' => 
        array (
            0 => __DIR__ . '/..' . '/jenssegers/imagehash/src',
        ),
    );

    public static function getInitializer(ClassLoader $loader)
    {
        return \Closure::bind(function () use ($loader) {
            $loader->prefixLengthsPsr4 = ComposerStaticInit9c8a4e6f46788e12c33474ee6ec81887::$prefixLengthsPsr4;
            $loader->prefixDirsPsr4 = ComposerStaticInit9c8a4e6f46788e12c33474ee6ec81887::$prefixDirsPsr4;

        }, null, ClassLoader::class);
    }
}
