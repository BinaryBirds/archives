import Image from 'next/image';

import styles from './post-header.module.css';
import moment from 'moment';

type PostHeaderProps = {
  title: string;
  image: string;
  date: string;
  description: string;
  tags: string;
};

function PostHeader({
  title,
  image,
  date,
  description,
  tags,
}: PostHeaderProps) {
  const formatedDate = moment(date).local().format('MMMM DD, YYYY');
  return (
    <header className={styles.header}>
      <h1>{title}</h1>
      <div className={styles.dateTags}>
        <time>{formatedDate}</time>
        <div className={styles.tags}>
          {tags.split(',').map((tag) => (
            <div key={tag} className={styles.tag}>
              {tag}
            </div>
          ))}
        </div>
      </div>
      <p className={styles.description}>{description}</p>
      <div className={styles.imageContainer}>
        <Image className={styles.image} src={image} alt={title} fill />
      </div>
    </header>
  );
}

export default PostHeader;
