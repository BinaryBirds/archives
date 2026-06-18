'use client';

import Link from 'next/link';
import styles from './navbar.module.css';
import Image from 'next/image';
import { HiOutlineEnvelope } from 'react-icons/hi2';
import { useEffect, useState } from 'react';
import lightLogo from '@/public/logo.png';
import darkLogo from '@/public/logo-dark.png';

export default function Navbar() {
  const [logo, setLogo] = useState(lightLogo);

  function setFavicon() {
    if (typeof document !== 'undefined') {
      let link =
        (document.querySelector("link[rel*='icon']") as HTMLLinkElement) ||
        document.createElement('link');
      link.type = 'image/x-icon';
      link.rel = 'shortcut icon';
      document.getElementsByTagName('head')[0].appendChild(link);

      if (
        window.matchMedia &&
        window.matchMedia('(prefers-color-scheme: dark)').matches
      ) {
        link.href = '/favicondark.ico';
        setLogo(darkLogo);
      } else {
        link.href = '/favicon.ico';
        setLogo(lightLogo);
      }
    }
  }

  useEffect(() => {
    setFavicon();

    if (typeof window !== 'undefined') {
      window
        .matchMedia('(prefers-color-scheme: dark)')
        .addEventListener('change', setFavicon);
    }

    return () => {
      if (typeof window !== 'undefined') {
        window
          .matchMedia('(prefers-color-scheme: dark)')
          .removeEventListener('change', setFavicon);
      }
    };
  }, []);

  return (
    <div className={styles.header}>
      <div className={styles.nav}>
        <div className={styles.logo}>
          <Link href={'/'} className={styles.logoLink}>
            <Image src={logo} width={32} height={32} alt='BinaryBirds logo' />
            <span className={styles.company}>Binary Birds</span>
          </Link>
        </div>
        <nav className={styles.navigation}>
          <ul>
            <li>
              <Link className={styles.menuItem} href={'/'}>
                About Us
              </Link>
            </li>
            <li>
              <Link className={styles.menuItem} href={'/'}>
                Development & Consulting
              </Link>
            </li>
            <li>
              <Link className={styles.menuItem} href={'/'}>
                Training
              </Link>
            </li>
            <li>
              <Link className={styles.menuItem} href={'/posts'}>
                Blog
              </Link>
            </li>
            <li>
              <a className={styles.login}>
                <HiOutlineEnvelope size={22} />
                Get in touch
              </a>
            </li>
          </ul>
        </nav>
      </div>
    </div>
  );
}
