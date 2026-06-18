'use client';

import Image from 'next/image';
import styles from './hero.module.css';
import lightSwallow from '@/public/swallow_light.png';
import darkSwallow from '@/public/swallow_dark.png';
import { useEffect, useState } from 'react';

export default function Hero() {
  const [swallow, setSwallow] = useState(lightSwallow);

  useEffect(() => {
    function updateSwallow() {
      if (
        window.matchMedia &&
        window.matchMedia('(prefers-color-scheme: dark)').matches
      ) {
        setSwallow(darkSwallow);
      } else {
        setSwallow(lightSwallow);
      }
    }

    updateSwallow();

    if (typeof window !== 'undefined') {
      window
        .matchMedia('(prefers-color-scheme: dark)')
        .addEventListener('change', updateSwallow);
    }

    return () => {
      if (typeof window !== 'undefined') {
        window
          .matchMedia('(prefers-color-scheme: dark)')
          .removeEventListener('change', updateSwallow);
      }
    };
  }, []);

  return (
    <header className={styles.heroSection}>
      <div className={styles.container}>
        <div className={styles.background}>
          <Image
            className={styles.backgroundImage}
            width={300}
            height={300}
            src={swallow}
            alt='background'
            priority
          />
        </div>
        <div className={styles.heroTitle}>
          <h1 className={styles.title}>Binary Birds</h1>
          <p className={styles.subtitle}>
            Server-side swift solutions from experts.
            <br /> Secure, efficient, scalable solutions.
          </p>
        </div>
      </div>
    </header>
  );
}
