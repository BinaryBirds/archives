'use client';

import Image from 'next/image';
import styles from './footer.module.css';
import lightLogo from '@/public/logo.png';
import darkLogo from '@/public/logo-dark.png';
import { useEffect, useState } from 'react';

export default function Footer() {
  const [logo, setLogo] = useState(lightLogo);

  useEffect(() => {
    function updateLogo() {
      if (
        window.matchMedia &&
        window.matchMedia('(prefers-color-scheme: dark)').matches
      ) {
        setLogo(darkLogo);
      } else {
        setLogo(lightLogo);
      }
    }

    updateLogo();

    if (typeof window !== 'undefined') {
      window
        .matchMedia('(prefers-color-scheme: dark)')
        .addEventListener('change', updateLogo);
    }

    return () => {
      if (typeof window !== 'undefined') {
        window
          .matchMedia('(prefers-color-scheme: dark)')
          .removeEventListener('change', updateLogo);
      }
    };
  }, []);

  const date = new Date();

  const currentYear = date.getFullYear();

  let copyrightDate: string;
  if (currentYear === 2022) {
    copyrightDate = `${currentYear}`;
  } else {
    copyrightDate = `2022-${currentYear}`;
  }

  return (
    <footer className={styles.footer}>
      <div className={styles.footerContainer}>
        <div className={styles.logo}>
          <h2 className={styles.footerTitle}>Binary Birds</h2>
          <Image src={logo} width={64} height={64} alt='BinaryBirds logo' />
          <p>
            Server-side swift solutions from experts.
            <br />
            Secure, efficient, scalable solutions.
          </p>
        </div>
        <div className={styles.links}>
          <h2 className={styles.footerTitle}>Quick links</h2>
          <ul>
            <li>About Us</li>
            <li>Development & Consulting</li>
            <li>Training</li>
            <li>Blog</li>
          </ul>
        </div>
        <div className={styles.socialMedia}>
          <h2 className={styles.footerTitle}>Social Media</h2>
          <ul>
            <li>GitHub</li>
            <li>X</li>
          </ul>
        </div>
      </div>
      <span
        className={styles.copyright}
      >{`Binary Birds © ${copyrightDate} - All Rights Reserved`}</span>
    </footer>
  );
}
