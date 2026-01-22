---
description: Da ngon ngu va ban dia hoa
user-invocable: false
---

# i18n Localization

Da ngon ngu va ban dia hoa

## Patterns

### React (react-intl)
```tsx
import { FormattedMessage } from 'react-intl';

<FormattedMessage id="greeting" defaultMessage="Hello" />
```

### Next.js (next-intl)
```tsx
import { useTranslations } from 'next-intl';

const t = useTranslations('Common');
<p>{t('greeting')}</p>
```

## File Structure

```
locales/
├── en/
│   ├── common.json
│   └── auth.json
├── vi/
│   ├── common.json
│   └── auth.json
└── ja/
    ├── common.json
    └── auth.json
```

## Best Practices

- Extract strings to files
- Use ICU message format
- Handle pluralization
- Date/currency formatting
- RTL support if needed
