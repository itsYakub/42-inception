<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the website, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://developer.wordpress.org/advanced-administration/wordpress/wp-config/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', getenv('MARIADB_NAME') );

/** Database username */
define( 'DB_USER', getenv('MARIADB_ADMIN_USER') );

/** Database password */
define( 'DB_PASSWORD', getenv('MARIADB_ROOT_PSWD') );

/** Database hostname */
define( 'DB_HOST', 'mariadb' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

define( 'WP_ALLOW_REPAIR', true );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         '`BK|s#+$eD?msE=)rAWTU@f]E>M+!W#6T{-akMJ0|)}+4FPElesLf| 0Ce!WmLt{');
define('SECURE_AUTH_KEY',  '~SIK0KWyc+Bi|eAAg@#O`wWl1*i}yA-4p]Kn/QN)DRI,V7]ZF$P~J_^,v0`Sz%,C');
define('LOGGED_IN_KEY',    'q2,w.-l}UP;pJ|+wxjY}9JW&_3PyW}*~=#wH.0`GmV{;v6m6_M1Nh8W]Nr+vmade');
define('NONCE_KEY',        'NLi^UXV9L.5IGCIT_%8L-m!X54J^CO_0M2>HA8Ilc?YD- CG.!U;B+#[eB4$8,;W');
define('AUTH_SALT',        'C%U9sPWVrWoNK/|b9#&7.2!Xa]Lsl*ZHyK79&k+[?5g{5D$GSM,fM+J5-}=(X->9');
define('SECURE_AUTH_SALT', 'y2|f*G!-|[uu<Xq^2I+]4~Pd.!n,Gl8:ow?13Fd/21Q;y*-`we$y35>rb|%!E425');
define('LOGGED_IN_SALT',   '+]~9UJdtcH~@W4w/amXh`~EHY$EFKkut(G|!]>SNC?a=)mBaa<Z^|)L#i4c?mX_x');
define('NONCE_SALT',       '[(`yqd-!q6D{OHqN9*>lMQx-(3GtJXl[E+-B1E39uOzZA,ut?7{2k>5A(|V?5{l>');

/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 *
 * At the installation time, database tables are created with the specified prefix.
 * Changing this value after WordPress is installed will make your site think
 * it has not been installed.
 *
 * @link https://developer.wordpress.org/advanced-administration/wordpress/wp-config/#table-prefix
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
 * @link https://developer.wordpress.org/advanced-administration/debug/debug-wordpress/
 */
define( 'WP_DEBUG', false );

/* Add any custom values between this line and the "stop editing" line. */



/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
