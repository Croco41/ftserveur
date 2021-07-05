<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** MySQL database username */
define( 'DB_USER', 'root' );

/** MySQL database password */
define( 'DB_PASSWORD', '' );

/** MySQL hostname */
define( 'DB_HOST', 'localhost' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         ' 7|BU@s7r{r0ql6=v2z!M}[<>GFGis!)N`W+/$O~<L?$2|q:TP~DC|e8/^}s6+gb');
define('SECURE_AUTH_KEY',  '+U|`-}7I9=q0Q[0CUL]|#~6!--Z70_N(`|V6~}j|J_PNvt0]ErY)V=]ETL{^+n-u');
define('LOGGED_IN_KEY',    '.H*y}-I:e+De!y=co1WBze#h8Zl=L_:,2P]|!$lM|-YD~.^2M(jLc~{?/.x:|/% ');
define('NONCE_KEY',        '.&9+4mt+EW:7e![8mK|N 0IIsCY2>_WT+Z$|g!m) W!|n0(R#8qAUq~N#-r.;VNq');
define('AUTH_SALT',        '-LA|NC-Mki^^hJhJQxjozg%n|/I.b9x)mG+n_:_-28o;h)NL9=OD$.gtOPKJb8,O');
define('SECURE_AUTH_SALT', 'Y7YH;gr?+$>S,3jqE<$xmBqF?KK[k&02 Ve~wPA9kH-=zBD5+m%-X`|7g|[ewm+q');
define('LOGGED_IN_SALT',   'I+>}P$Cx6;WIWFac-vP2c0Vv`mTC%cbBgEnvLBZ+-6Y=V-n}15!~xGPcx-}5U#W9');
define('NONCE_SALT',       'Hc*g2s0i>3+4#F-;V!D]>~?Ie7GXE~wVuz-.-d{aUSx2Sk4K:;X#nQ[!&_M~2s<m');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', dirname(__FILE__) . '/' );
}

/** Sets up WordPress vars and included files. */
require_once (ABSPATH . 'wp-settings.php');

