import { ReactNode } from 'react';
import styles from './card.module.css';

type CardProps = {
  children: ReactNode;
  className?: string;
};

export default function Card({ children, className }: CardProps) {
  return <div className={`${className} ${styles.card}`}>{children}</div>;
}
